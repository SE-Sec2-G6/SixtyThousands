import { test, expect } from '@playwright/test';

test('test', async ({ page }) => {
  await page.goto('http://localhost:8080/en/');
  await page.getByRole('link', { name: '[Pre-Order] Polo Shirt V.1' }).first().click();
  await page.getByRole('button', { name: ' Add to cart' }).click();
  await page.getByRole('link', { name: ' Go to cart' }).click();
  await page.getByRole('link', { name: 'Proceed to checkout' }).click();
  await page.getByLabel('First name').click();
  await page.getByLabel('First name').fill('Wongsakorn');
  await page.getByLabel('First name').press('Tab');
  await page.getByLabel('Last name').fill('Saengsuk');
  await page.getByLabel('Last name').press('Tab');
  await page.getByLabel('Email').fill('wongsakorn.s@');
  await page.getByLabel('Email').press('Tab');
  await page.getByRole('button', { name: 'Continue' }).press('Enter');
});