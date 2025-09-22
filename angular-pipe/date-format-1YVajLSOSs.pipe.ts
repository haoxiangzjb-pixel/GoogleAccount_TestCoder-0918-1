import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'dateFormat'
})
export class DateFormatPipe implements PipeTransform {

  transform(value: any, format?: string): string {
    if (!value) return '';
    
    const date = new Date(value);
    if (isNaN(date.getTime())) return value;
    
    // Default format
    if (!format) {
      return date.toLocaleDateString();
    }
    
    // Handle different format strings
    switch (format) {
      case 'short':
        return date.toLocaleDateString([], { year: 'numeric', month: 'short', day: 'numeric' });
      case 'long':
        return date.toLocaleDateString([], { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' });
      case 'iso':
        return date.toISOString().split('T')[0];
      case 'time':
        return date.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
      case 'datetime':
        return `${date.toLocaleDateString()} ${date.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' })}`;
      default:
        return date.toLocaleDateString();
    }
  }
}