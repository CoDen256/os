import static com.google.common.truth.Truth.assertThat;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import org.junit.jupiter.api.Test;

#parse("File Header.java")
/**
* Unit tests pertaining {@link ${CLASS_NAME}}
*/
class ${NAME} {

  private final ${CLASS_NAME} sut = new ${CLASS_NAME}(mock(), mock());
  ${BODY}
}