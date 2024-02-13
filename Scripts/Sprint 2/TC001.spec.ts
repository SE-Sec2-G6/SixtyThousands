import { test, expect } from '@playwright/test';

test('test', async ({ page }) => {
  await page.goto('http://localhost:8080/en/');
  await page.getByRole('link', { name: 'Polo Shirt V.2' }).first().click();
  await page.getByRole('button', { name: ' Add to cart' }).click();
  await page.getByRole('link', { name: ' Proceed to checkout' }).click();
  await page.getByRole('link', { name: 'Proceed to checkout' }).click();
  await page.getByLabel('Mr.').check();
  await page.getByLabel('First name').click();
  await page.getByLabel('First name').fill('tanabodee');
  await page.getByLabel('First name').press('Tab');
  await page.getByLabel('Last name').fill('mungruayklang');
  await page.getByLabel('Last name').press('Tab');
  await page.getByLabel('Email').fill('tanabodee.m@kkumail.com');
  await page.getByRole('button', { name: 'Continue' }).click();
  await page.getByLabel('Online Payment').check();
  await page.getByLabel('I agree to the terms of').check();
  await page.getByRole('button', { name: 'Place order' }).click();
  await page.getByLabel('แนบสลิปการโอน').click();
  await page.getByLabel('แนบสลิปการโอน').setInputFiles('logo.7922285.png');
  await page.getByRole('button', { name: 'Upload' }).click();
});