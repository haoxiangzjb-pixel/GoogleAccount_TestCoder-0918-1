import { Component } from '@angular/core';
import { DataService, DataItem } from './data.service';
import { FileService } from './file.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.html',
  styleUrl: './app.scss'
})
export class App {
  title = 'HTTP Data Service with Random File Name';
  data: DataItem[] | null = null;
  savedFileName: string | null = null;
  isLoading = false;
  error: string | null = null;

  constructor(
    private dataService: DataService,
    private fileService: FileService
  ) {}

  fetchData(): void {
    this.isLoading = true;
    this.error = null;
    this.data = null;
    
    this.dataService.getData().subscribe({
      next: (response) => {
        this.data = response.slice(0, 10);
        this.isLoading = false;
      },
      error: (err) => {
        this.error = 'Error fetching data: ' + err.message;
        this.isLoading = false;
      }
    });
  }

  saveDataToFile(): void {
    if (this.data && this.data.length > 0) {
      const fileName = this.fileService.saveFileLocally(this.data);
      this.savedFileName = fileName;
      
      // Also trigger download
      this.fileService.downloadFile(this.data);
    }
  }

  generateRandomName(): string {
    return this.fileService.generateRandomFileName('json');
  }
}
