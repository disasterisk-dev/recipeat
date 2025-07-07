/**
 * Sanitise recipe steps to follow basic format
 * @param {string|number|undefined} input the unformatted serving value
 * @return {number} formatted serving number
 */
export default function formatServings(input: string | number | undefined) {
  if (typeof input == "undefined") return 0;
  if (typeof input == "number") return input;

  const numOnly = input.toString().replaceAll(/\D/g, " ");
  const values = numOnly.split(" ").filter((v) => v !== "");

  const servings = isNaN(parseInt(values[0])) ? 0 : parseInt(values[0]);

  return servings;
}
