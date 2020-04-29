const { Builder, By } = require('selenium-webdriver');
const sleep = require('sleep');

(async function main() {
  const driver = await new Builder().forBrowser('chrome').build();

  driver.manage().window().setSize(1280, 720);
  driver.manage().deleteAllCookies();
  driver
    .manage()
    .timeouts()
    .pageLoadTimeout(40 * 1000);
  driver
    .manage()
    .timeouts()
    .implicitlyWait(30 * 1000);

  try {
    // Navigate to Url
    await driver.get('https://www.ebay.com');

    // From search box, enter a text
    await driver.findElement(By.xpath("//input[@id='gh-ac']")).sendKeys('DevOps');

    // Hit search button
    await driver.findElement(By.xpath("//input[@id='gh-btn']")).click();

    sleep.sleep(5);
  } finally {
    driver.quit();
  }
})();
