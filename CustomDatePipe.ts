import { Pipe, PipeTransform } from '@angular/core';

/**
 * A pipe to format dates using the Intl.DateTimeFormat API.
 * Usage: {{ value | customDate:'shortDate' }}
 * Where 'value' is a Date object or a string that can be parsed into a Date,
 * and 'shortDate' is one of the predefined formats.
 */
@Pipe({
  name: 'customDate',
  standalone: true
})
export class CustomDatePipe implements PipeTransform {

  private readonly formats: { [key: string]: Intl.DateTimeFormatOptions } = {
    shortDate: { year: 'numeric', month: 'short', day: 'numeric' },
    longDate: { year: 'numeric', month: 'long', day: 'numeric' },
    medium: { year: 'numeric', month: 'short', day: 'numeric', hour: '2-digit', minute: '2-digit' },
    full: { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric', hour: '2-digit', minute: '2-digit', second: '2-digit' },
    timeOnly: { hour: '2-digit', minute: '2-digit' }
  };

  transform(value: string | Date | null | undefined, formatKey: string = 'shortDate'): string {
    if (value === null || value === undefined || value === '') {
      return '';
    }

    const date = new Date(value);
    if (isNaN(date.getTime())) {
      console.error('Invalid date passed to CustomDatePipe:', value);
      return '';
    }

    const options = this.formats[formatKey] || this.formats['shortDate'];
    return new Intl.DateTimeFormat('en-US', options).format(date);
  }
}
