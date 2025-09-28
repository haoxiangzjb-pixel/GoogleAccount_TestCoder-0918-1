import { Pipe, PipeTransform } from '@angular/core';

/**
 * A pipe to format a date string or Date object into a more readable form.
 * Usage: {{ date_expression | dateFormat:'format_string' }}
 * Example: {{ myDate | dateFormat:'yyyy-MM-dd' }}
 */
@Pipe({
  name: 'dateFormat',
  standalone: true // Marking it as standalone for easier import in modern Angular
})
export class DateFormatPipe implements PipeTransform {

  transform(value: string | Date | null | undefined, format: string = 'yyyy-MM-dd'): string {
    if (value === null || value === undefined || value === '') {
      return '';
    }

    const date = new Date(value);
    if (isNaN(date.getTime())) {
      console.error('Invalid date passed to dateFormat pipe:', value);
      return '';
    }

    const map: { [key: string]: string } = {
      'yyyy': date.getFullYear().toString(),
      'MM': (date.getMonth() + 1).toString().padStart(2, '0'),
      'dd': date.getDate().toString().padStart(2, '0'),
      'HH': date.getHours().toString().padStart(2, '0'),
      'mm': date.getMinutes().toString().padStart(2, '0'),
      'ss': date.getSeconds().toString().padStart(2, '0'),
    };

    let formatted = format;
    Object.keys(map).forEach(key => {
      formatted = formatted.replace(new RegExp(key, 'g'), map[key]);
    });

    return formatted;
  }
}