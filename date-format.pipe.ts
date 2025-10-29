import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'dateFormat'
})
export class DateFormatPipe implements PipeTransform {
  transform(value: any, format: string = 'YYYY-MM-DD'): string {
    if (!value) {
      return '';
    }

    // 尝试将输入转换为Date对象
    const date = new Date(value);
    
    // 检查日期是否有效
    if (isNaN(date.getTime())) {
      console.warn('Invalid date:', value);
      return '';
    }

    // 定义格式化选项
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const day = String(date.getDate()).padStart(2, '0');
    const hours = String(date.getHours()).padStart(2, '0');
    const minutes = String(date.getMinutes()).padStart(2, '0');
    const seconds = String(date.getSeconds()).padStart(2, '0');
    
    // 根据指定格式进行替换
    let formattedDate = format
      .replace('YYYY', year.toString())
      .replace('MM', month)
      .replace('DD', day)
      .replace('HH', hours)
      .replace('mm', minutes)
      .replace('ss', seconds);

    return formattedDate;
  }
}