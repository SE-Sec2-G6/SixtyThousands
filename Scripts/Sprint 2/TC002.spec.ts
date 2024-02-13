import { test, expect } from '@playwright/test';

test('test', async ({ page }) => {
  await page.goto('http://localhost:8080/en/');
  await page.getByRole('link', { name: 'Polo Shirt V.1' }).first().click();
  await page.getByRole('button', { name: '' }).dblclick();
  await page.getByRole('button', { name: '' }).dblclick();
  await page.getByRole('button', { name: ' Add to cart' }).click();
  await page.getByRole('link', { name: ' Proceed to checkout' }).click();
});