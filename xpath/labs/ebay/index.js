const { Builder, By } = require('selenium-webdriver');

(async function main() {
  const driver = await new Builder().forBrowser('chrome').build();

  // Navigate to Url
  await driver.get('https://www.ebay.com');

  // From search box, enter a text
  await driver.findElement(By.xpath("//input[@id='gh-ac']")).sendKeys('DevOps');

  // Hit search button
  await driver.findElement(By.xpath("//input[@id='gh-btn']")).click();
})();
