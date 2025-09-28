import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'formatDate'
})
export class FormatDatePipe implements PipeTransform {

  transform(value: any, format: string = 'mediumDate'): string {
    if (!value) return '';
    const date = new Date(value);
    if (isNaN(date.getTime())) {
      console.error('Invalid date:', value);
      return '';
    }

    const options: Intl.DateTimeFormatOptions = {};

    switch (format) {
      case 'short':
        options.dateStyle = 'short';
        break;
      case 'medium':
        options.dateStyle = 'medium';
        break;
      case 'long':
        options.dateStyle = 'long';
        break;
      case 'full':
        options.dateStyle = 'full';
        break;
      case 'shortTime':
        options.timeStyle = 'short';
        break;
      case 'mediumTime':
        options.timeStyle = 'medium';
        break;
      case 'longTime':
        options.timeStyle = 'long';
        break;
      case 'fullTime':
        options.timeStyle = 'full';
        break;
      case 'shortDate':
        options.dateStyle = 'short';
        break;
      case 'mediumDate':
        options.dateStyle = 'medium';
        break;
      case 'longDate':
        options.dateStyle = 'long';
        break;
      case 'fullDate':
        options.dateStyle = 'full';
        break;
      case 'mediumDateTime':
        options.dateStyle = 'medium';
        options.timeStyle = 'medium';
        break;
      case 'longDateTime':
        options.dateStyle = 'long';
        options.timeStyle = 'long';
        break;
      default:
        // For custom formats, we could use Intl.DateTimeFormat with specific options
        // For simplicity, defaulting to mediumDate
        options.dateStyle = 'medium';
    }

    return new Intl.DateTimeFormat('en-US', options).format(date);
  }
}