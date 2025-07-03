function verArray(array) {
  if (array.length === 0) {
    console.log("-1");
  } else console.log(array[array.length - 1]);
}

const arr = [1, 4, 30];

verArray(arr);
/**
 * const arr = [1, 2, 3];
 * arr.last(); // 3
 */
