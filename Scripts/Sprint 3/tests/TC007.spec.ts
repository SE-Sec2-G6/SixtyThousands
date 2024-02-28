import { test, expect } from '@playwright/test';

test('test', async ({ page }) => {
  await page.goto('http://localhost:8080/en/');
  await page.getByRole('link', { name: '[Pre-Order] Polo Shirt V.1' }).first().click();
  await page.getByRole('button', { name: ' Add to cart' }).click();
  await page.getByRole('link', { name: ' Go to cart' }).click();
  await page.getByRole('link', { name: 'Proceed to checkout' }).click();
  await page.getByLabel('First name').click();
  await page.getByLabel('First name').fill('Tanabodee');
  await page.getByLabel('First name').press('Tab');
  await page.getByLabel('Last name').fill('Mungruayklang');
  await page.getByLabel('Last name').press('Tab');
  await page.getByLabel('Email').fill('Tanabodee.m@kkumail.com');
  await page.getByLabel('Email').press('Tab');
  await page.getByRole('button', { name: 'Continue' }).press('Enter');
  await page.getByLabel('Prompt Pay').check();
  await page.getByRole('button', { name: 'Place order' }).click();
  //await page.getByLabel('แนบใบเสร็จการชำระเงิน').click();
  await page.getByLabel('แนบใบเสร็จการชำระเงิน').setInputFiles('Ratatouille.jpg');
  await page.getByRole('button', { name: 'Upload' }).click();
});