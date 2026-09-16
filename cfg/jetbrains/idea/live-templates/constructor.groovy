import com.intellij.psi.PsiDocumentManager
import com.intellij.psi.PsiModifier
import com.intellij.psi.PsiField

def editor = _editor

def psiFile = PsiDocumentManager.getInstance(editor.getProject()).getPsiFile(editor.getDocument())

def cls = psiFile.findElementAt(editor.caretModel.offset)?.parent

while (cls != null && !(cls instanceof com.intellij.psi.PsiClass)) {
       cls = cls.parent
   }

def allFields = cls?.allFields ?: []

// 0. Split fields: final & non-static -> constructor args; non-final & non-static -> setters
def finalFields = allFields.findAll {
    it.hasModifierProperty(PsiModifier.FINAL) && !it.hasModifierProperty(PsiModifier.STATIC)
}

def nonFinalFields = allFields.findAll {
    !it.hasModifierProperty(PsiModifier.FINAL) && !it.hasModifierProperty(PsiModifier.STATIC)
}

def name = cls?.name

def params = finalFields.collect { it.type.presentableText + ' ' + it.name }.join(', ')
def declarations = finalFields.collect { '        this.' + it.name + ' = java.util.Objects.requireNonNull(' + it.name + ');' }.join('\n')

// 1. Javadoc for constructor
def constructorJavadoc = '''    /**
     * Constructs a new instance of {@code ''' + name + '''}.
     *
''' + finalFields.collect { '     * @param ' + it.name + ' the ' + it.name }.join('\n') + '''
     */
'''

def constructor = constructorJavadoc + '''    public ''' + name + '''(''' + params + ''') {
''' + declarations + '''
    }
'''

// 2. Setters for non-final, non-static fields, "builder-style" (return this)
def setters = nonFinalFields.collect { PsiField field ->
    def fieldName = field.name
    def fieldType = field.type.presentableText
    def capitalized = fieldName[0].toUpperCase() + fieldName[1..-1]

    '''    /**
     * Set ''' + fieldName + '''.
     */
    public ''' + name + ''' set''' + capitalized + '''(''' + fieldType + ''' ''' + fieldName + ''') {
        this.''' + fieldName + ''' = java.util.Objects.requireNonNull(''' + fieldName + ''');
        return this;
    }
'''
}.join('\n')

return constructor + (setters ? '\n' + setters : '')