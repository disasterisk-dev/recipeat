import {parse} from "tinyduration";

/**
 * convert ISO duration into minutes
 * @param {string|undefined} duration ISO duration string or undefined
 * @return {number} number of minutes in duration
 */
export default function durationToMinutes(duration: string | undefined) {
  if (typeof duration == "undefined") return 0;

  const durationObj = parse(duration);

  const hours = durationObj.hours ? durationObj.hours * 60 : 0;
  const minutes = durationObj.minutes ? durationObj.minutes : 0;
  const seconds = durationObj.seconds ? Math.ceil(durationObj.seconds / 60) : 0;

  return hours + minutes + seconds;
}
