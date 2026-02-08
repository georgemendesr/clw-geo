const puppeteer = require('puppeteer');

(async () => {
    try {
        console.log('Launching browser...');
        const browser = await puppeteer.launch({
            headless: "new",
            args: ['--no-sandbox', '--disable-setuid-sandbox'] // Required for running as root
        });

        const page = await browser.newPage();
        console.log('Navigating to example.com...');
        await page.goto('https://example.com');

        const title = await page.title();
        console.log(`Page Title: ${title}`);

        if (title === 'Example Domain') {
            console.log('SUCCESS: Browser is working correctly.');
            await page.screenshot({ path: 'example.png' });
            console.log('Screenshot saved to example.png');
        } else {
            console.log('FAILURE: Title did not match.');
        }

        await browser.close();
    } catch (error) {
        console.error('ERROR:', error);
        process.exit(1);
    }
})();
