import { Pipe, PipeTransform } from '@angular/core';

/**
 * A pipe to format a date string or Date object into a more readable form.
 * Example usage: {{ dateValue | formatDate }}
 */
@Pipe({
  name: 'formatDate'
})
export class FormatDatePipe implements PipeTransform {

  /**
   * Transforms the input value into a formatted date string.
   * @param value The input value, expected to be a Date object, a date string, or a timestamp.
   * @returns A string representing the formatted date in 'YYYY-MM-DD HH:mm:ss' format, or 'Invalid Date' if the input is not valid.
   */
  transform(value: any): string {
    if (value === null || value === undefined) {
      return '';
    }

    let date = new Date(value);

    if (isNaN(date.getTime())) {
      // If the date object is invalid, return a specific string or an empty string
      console.error('Invalid date received by FormatDatePipe:', value);
      return 'Invalid Date';
    }

    // Format the date parts
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, '0'); // Months are 0-indexed
    const day = String(date.getDate()).padStart(2, '0');
    const hours = String(date.getHours()).padStart(2, '0');
    const minutes = String(date.getMinutes()).padStart(2, '0');
    const seconds = String(date.getSeconds()).padStart(2, '0');

    return `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;
  }
}