import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class FileService {
  
  generateRandomFileName(extension: string = 'json'): string {
    const randomString = Math.random().toString(36).substring(2, 15);
    const timestamp = Date.now().toString(36);
    return `${randomString}_${timestamp}.${extension}`;
  }

  downloadFile(data: any, fileName?: string): void {
    const filename = fileName || this.generateRandomFileName('json');
    const dataStr = JSON.stringify(data, null, 2);
    const blob = new Blob([dataStr], { type: 'application/json' });
    
    const url = window.URL.createObjectURL(blob);
    const link = document.createElement('a');
    link.href = url;
    link.download = filename;
    link.click();
    
    window.URL.revokeObjectURL(url);
  }

  saveFileLocally(data: any, fileName?: string): string {
    const filename = fileName || this.generateRandomFileName('json');
    const dataStr = JSON.stringify(data, null, 2);
    
    localStorage.setItem(filename, dataStr);
    console.log(`Data saved to local storage with key: ${filename}`);
    
    return filename;
  }
}
