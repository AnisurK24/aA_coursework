const Util = {

inherits (childClass, parentClass)  {
    // function Surrogate(){}
    // Surrogate.prototype = parentClass.prototype;
    childClass.prototype = Object.create(parentClass.prototype);
    childClass.prototype.constructor = childClass;
},
// Return a randomly oriented vector with the given length.
randomVec(length) {
    const deg = 2 * Math.PI * Math.random();
    return Util.scale([Math.sin(deg), Math.cos(deg)], length);
},
// Scale the length of a vector by the given amount.
scale(vec, m) {
    return [vec[0] * m, vec[1] * m];
},
wrap(coord, max) {
    if (coord < 0) {
        return max - (coord % max);
    } else if (coord > max) {
        return coord % max;
    } else {
        return coord;
    }
},
distance(pos1, pos2) {
    return Math.sqrt(Math.pow((pos1[0] - pos2[0]), 2) + Math.pow((pos1[1] - pos2[1]), 2));
}








};

// Other properties are filled in for you.
// new Asteroid({ pos: [30, 30] });

module.exports = Util;