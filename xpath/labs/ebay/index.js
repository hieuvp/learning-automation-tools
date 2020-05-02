const { Builder, By } = require('selenium-webdriver');
const { sleep } = require('sleep');

(async function main() {
  const driver = await new Builder().forBrowser('chrome').build();

  driver.manage().window().setSize(1280, 720);
  driver.manage().deleteAllCookies();

  try {
    // Navigate to ebay.com
    await driver.get('https://www.ebay.com');

    // By using XPath, we are able to locate the search box,
    // and "sendKeys()" to search for a value of "DevOps"
    await driver.findElement(By.xpath("//input[@id='gh-ac']")).sendKeys('DevOps');

    // Hit the "Search" button to redirect to the results page
    await driver.findElement(By.xpath("//input[@id='gh-btn']")).click();

    sleep(5);
  } finally {
    driver.quit();
  }
})();
