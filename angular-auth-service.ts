import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';

export interface User {
  id?: string;
  email: string;
  name?: string;
}

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private currentUserKey = 'currentUser';
  private isAuthenticatedSubject = new BehaviorSubject<boolean>(this.hasToken());
  private userSubject = new BehaviorSubject<User | null>(this.getCurrentUserFromStorage());

  public isAuthenticated$ = this.isAuthenticatedSubject.asObservable();
  public user$ = this.userSubject.asObservable();

  constructor() { }

  /**
   * Iniciar sesión
   */
  login(email: string, password: string): Observable<boolean> {
    // Simulación de autenticación
    // En una aplicación real, aquí se haría una llamada al backend
    return new Observable(observer => {
      setTimeout(() => {
        if (email && password) {
          const user: User = {
            email: email,
            name: email.split('@')[0]
          };
          this.setCurrentUser(user);
          this.isAuthenticatedSubject.next(true);
          observer.next(true);
          observer.complete();
        } else {
          observer.next(false);
          observer.complete();
        }
      }, 1000); // Simulación de delay de red
    });
  }

  /**
   * Cerrar sesión
   */
  logout(): void {
    localStorage.removeItem(this.currentUserKey);
    this.userSubject.next(null);
    this.isAuthenticatedSubject.next(false);
  }

  /**
   * Registrar un nuevo usuario
   */
  register(email: string, password: string, name: string): Observable<boolean> {
    // Simulación de registro
    return new Observable(observer => {
      setTimeout(() => {
        if (email && password && name) {
          // En una aplicación real, aquí se haría la llamada al backend
          const user: User = {
            email: email,
            name: name
          };
          this.setCurrentUser(user);
          this.isAuthenticatedSubject.next(true);
          observer.next(true);
          observer.complete();
        } else {
          observer.next(false);
          observer.complete();
        }
      }, 1000); // Simulación de delay de red
    });
  }

  /**
   * Verificar si el usuario está autenticado
   */
  isAuthenticated(): boolean {
    return this.isAuthenticatedSubject.value;
  }

  /**
   * Obtener el usuario actual
   */
  getCurrentUser(): User | null {
    return this.userSubject.value;
  }

  /**
   * Verificar si hay un token en localStorage
   */
  private hasToken(): boolean {
    return !!localStorage.getItem(this.currentUserKey);
  }

  /**
   * Obtener el usuario actual del localStorage
   */
  private getCurrentUserFromStorage(): User | null {
    const userStr = localStorage.getItem(this.currentUserKey);
    return userStr ? JSON.parse(userStr) : null;
  }

  /**
   * Establecer el usuario actual en localStorage y en el subject
   */
  private setCurrentUser(user: User): void {
    localStorage.setItem(this.currentUserKey, JSON.stringify(user));
    this.userSubject.next(user);
  }

  /**
   * Actualizar la información del usuario
   */
  updateUser(updatedUser: User): void {
    if (this.isAuthenticated()) {
      localStorage.setItem(this.currentUserKey, JSON.stringify(updatedUser));
      this.userSubject.next(updatedUser);
    }
  }
}