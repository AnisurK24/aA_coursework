function inOrderArray(root) {
    if (!root) return [];

    inOrderArray(root.left, arr);
    arr.push(root.val);
    inOrderArray(root.right, arr);

    return arr;
}

function postOrderArray(root) {
    if (!root) return [];

    postOrderArray(root.left, arr);
    postOrderArray(root.right, arr);
    arr.push(root.val);

    return arr;
}


module.exports = {
    inOrderArray,
    postOrderArray
};