import { Pipe, PipeTransform } from '@angular/core';

/**
 * 自定义管道，用于格式化日期。
 * 使用示例: {{ someDate | customDate }} 或 {{ someDate | customDate:'shortDate' }}
 */
@Pipe({
  name: 'customDate'
})
export class CustomDatePipe implements PipeTransform {
  /**
   * 转换输入的值为指定格式的日期字符串。
   * @param value 输入的日期值，可以是 Date 对象、时间戳或 ISO 字符串。
   * @param format 输出的日期格式，默认为 'mediumDate'。
   * @returns 格式化后的日期字符串，如果输入无效则返回 'Invalid Date'。
   */
  transform(value: any, format: string = 'mediumDate'): string {
    // 尝试将输入值转换为 Date 对象
    const date = new Date(value);

    // 检查日期对象是否有效
    if (isNaN(date.getTime())) {
      return 'Invalid Date';
    }

    // 使用 Angular 的内置 DatePipe 进行格式化
    // 这里为了演示，我们直接使用 JavaScript 的 toLocaleDateString 方法
    // 在实际 Angular 应用中，注入 DatePipe 服务会更灵活
    const options: Intl.DateTimeFormatOptions = this.getFormatOptions(format);
    return date.toLocaleDateString('zh-CN', options);
  }

  /**
   * 根据字符串格式返回对应的 Intl.DateTimeFormatOptions。
   * 这是一个简化的映射，实际应用中可以更复杂。
   * @param format 格式字符串。
   * @returns Intl.DateTimeFormatOptions 对象。
   */
  private getFormatOptions(format: string): Intl.DateTimeFormatOptions {
    switch (format) {
      case 'short':
        return { year: 'numeric', month: 'numeric', day: 'numeric' };
      case 'medium':
        return { year: 'numeric', month: 'short', day: 'numeric' };
      case 'long':
        return { year: 'numeric', month: 'long', day: 'numeric' };
      case 'shortTime':
        return { hour: 'numeric', minute: 'numeric', hour12: false };
      case 'mediumTime':
        return { hour: 'numeric', minute: 'numeric', second: 'numeric', hour12: false };
      case 'shortDate':
        return { year: '2-digit', month: '2-digit', day: '2-digit' };
      case 'mediumDate':
      default:
        return { year: 'numeric', month: 'short', day: 'numeric' };
    }
  }
}
