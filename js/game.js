function launchGlass() {
    var newGlass = glass.createObject(scene.world);
    newGlass.x = width;
    newGlass.y = scene.height - units.gu(20);
}
