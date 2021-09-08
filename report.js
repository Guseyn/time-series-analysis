const mdpdf = require('mdpdf');
const path = require('path');
 
let options = {
    source: path.join(__dirname, 'report.md'),
    destination: path.join(__dirname, 'report.pdf'),
    styles: path.join(__dirname, 'report.css'),
    ghStyle: true,
    defaultStyle: true,
    pdf: {
        format: 'A4',
        orientation: 'portrait'
    }
};
 
mdpdf.convert(options).then((pdfPath) => {
    console.log('PDF Path:', pdfPath);
}).catch((err) => {
    console.error(err);
});