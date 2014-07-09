function newGame() {
    for (var i = 0; i < 10; i++) {
        for (var j = 0; j < 10; j++) {
            var newBox = ballComponent.createObject(scene.world);
            newBox.x = width / 3 + units.gu(1.5*j);
            newBox.y = units.gu(1.5*i);
        }
    }
    scene.running = true;
}
