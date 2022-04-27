//~importmodules
const { Router } = require('express');
const router = Router();
const { renderHomePage } = require('./controller/main.controller');

//~routers
router.get('/', renderHomePage)

module.exports = router;
