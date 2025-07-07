/**
 * Sanitise recipe steps to follow basic format
 * @param {string|string[]|object[]} instructions the original instruction value
 * @return {string[]} an array of strings with instructions
 */
export default function formatInstructions(
  instructions: string | string[] | object[]
) {
  const formattedSteps: string[] = [];

  if (typeof instructions == "string") {
    // Some sites (looking at you Jamie Oliver)
    // have one single string for the instructions.

    formattedSteps.push(...instructions.split(". "));
  } else {
    // some recipes have objects for each step
    // strips everything but the actual instruction text out

    instructions.forEach((element) => {
      if (typeof element == "string") {
        formattedSteps.push(element);
      } else {
        // @ts-expect-error - it appears to be standard
        // practice for "text" to be the key used here
        formattedSteps.push(element["text"].toString());
      }
    });
  }

  return formattedSteps;
}
