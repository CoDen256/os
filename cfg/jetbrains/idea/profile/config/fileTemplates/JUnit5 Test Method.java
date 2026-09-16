@org.junit.jupiter.api.Test
void ${NAME}() {
  // setup
  ${BODY}

  // exercise
  long result = sut.${NAME}();

  // verify
  assertEquals(expected, result);
}