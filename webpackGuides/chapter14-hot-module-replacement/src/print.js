export default function printMe (str) {
  if (typeof str !== "string") {
    str = "btn"
  }
  console.log(`I get called from print.js(newer),location:${str}`)
}