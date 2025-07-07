import {parse} from "node-html-parser";
import formatInstructions from "./utils/formatInstructions";
import formatServings from "./utils/formatServings";
import durationToMinutes from "./utils/durationToMinutes";

/**
 * Scrape recipe data and return
 * @param {string} url the url to be searched
 * @return {object} the scraped data
 */
export async function fetchFromJSON(url: string) {
  let data = null;

  const html = await fetch(url)
    .then(async (response) => {
      return parse(await response.text());
    })
    .catch((error) => {
      console.error("Failed to fetch page: ", error);
      return null;
    });

  if (!html) return null;

  // search for JSON-LD data
  const element = html.querySelector("script[type=\"application/ld+json\"]");
  if (element) {
    // parse JSON data
    let json = JSON.parse(element.innerHTML);

    if (Array.isArray(json)) {
      json = json[0];
    }

    // catch variation in json-ld formatting
    try {
      json = json["@graph"][0];
    } catch (e) {
      console.log(e);
    }

    console.log(json);

    const formattedSteps = formatInstructions(json["recipeInstructions"]);

    data = {
      author: json["author"]["name"],
      name: json["name"],
      description: json["description"],
      ingredients: json["recipeIngredient"],
      methodSteps: formattedSteps,
      servingSize: formatServings(json["recipeYield"]),
      prepTime: durationToMinutes(json["prepTime"]),
      cookingTime: durationToMinutes(json["cookTime"]),
    };
  }

  // sort necessary data into an object
  return data;
}
