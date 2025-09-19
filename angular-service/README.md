# Angular HTTP Data Service

This is a simple Angular service for fetching data via HTTP.

## Files included:
1. `data-fetch.service.ts` - The main service for fetching data
2. `http.module.ts` - Module that imports HttpClientModule

## Usage:

1. Import the HttpModule in your app module:
```typescript
import { HttpModule } from './http.module';

@NgModule({
  imports: [
    // other imports
    HttpModule
  ],
  // ...
})
export class AppModule { }
```

2. Use the service in your components:
```typescript
import { DataFetchService } from './data-fetch.service';

@Component({
  // ...
})
export class MyComponent {
  constructor(private dataService: DataFetchService) {}

  fetchData() {
    this.dataService.getData().subscribe(
      (data) => console.log(data),
      (error) => console.error(error)
    );
  }
}
```

## Methods:
- `getData()` - Fetches all posts from JSONPlaceholder
- `getDataById(id: number)` - Fetches a specific post by ID