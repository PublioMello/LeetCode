// You are given two non-empty linked lists representing two non-negative integers.
// The digits are stored in reverse order, and each of their nodes contains a single digit.
// Add the two numbers and return the sum as a linked list.
// You may assume the two numbers do not contain any leading zero, except the number 0 itself.

let l1 = [2, 4, 3];
let l2 = [1, 5, 4];
function reverter(l1, l2) {
  // Reverse the lists
  let list1 = l1.reverse();
  let list2 = l2.reverse();
  // transform the lists in a number
  let num1 = parseInt(list1.join(""));
  let num2 = parseInt(list2.join(""));

  let num3 = num1 + num2;

  let list3 = [...String(num3)].map(Number).reverse();
  console.log(list3);
}
reverter(l1, l2);
