function launchGlass() {
    var newGlass = glass.createObject(scene.world);
    newGlass.x = width;
    newGlass.y = scene.height - units.gu(20);
}

function endGame() {
    scene.running = false;
    game.popScene();
        if (score > settings.highScore) {
        settings.highScore = score;
        settings.highLevel = level;
    }

    isDoorOpen = false;
    numberOfBalls = 100;
    score = 0;
    level = 1;
    velocity = 10;
    glassScore = 1;

    if (page) {
        page.destroy(100);
    }

    var component = Qt.createComponent(Qt.resolvedUrl("../components/StartPage.qml"));
    var page = component.createObject(mainview, {highScore: settings.highScore, anotherGame: true});
    pagestack.push(page);
}
