import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PruebaComponente } from './prueba-componente';

describe('PruebaComponente', () => {
  let component: PruebaComponente;
  let fixture: ComponentFixture<PruebaComponente>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [PruebaComponente],
    }).compileComponents();

    fixture = TestBed.createComponent(PruebaComponente);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
