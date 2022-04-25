//~importmodules
const { Router } = require('express');
const router = Router();
const mainController = require('./controller/main.controller');
const { renderHomePage } = mainController;

//~routers
router.get('/', renderHomePage)

module.exports = router;
