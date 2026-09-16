import com.intellij.psi.PsiDocumentManager

def editor = _editor

def psiFile = PsiDocumentManager.getInstance(editor.getProject()).getPsiFile(editor.getDocument())

def cls = psiFile.findElementAt(editor.caretModel.offset)?.parent

while (cls != null && !(cls instanceof com.intellij.psi.PsiClass)) {
       cls = cls.parent
   }

def params =  cls?.allFields?.collect { it.type.presentableText + ' ' + it.name }?.join(', ')
def name = cls?.name
def declarations = cls?.allFields?.collect { '    this.' + it.name + ' = java.util.Objects.requireNonNull(' + it.name + ');' }?.join('\n')

return """public $name($params){\n$declarations
}
"""