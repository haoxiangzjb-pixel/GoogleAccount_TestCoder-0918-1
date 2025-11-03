const personObject = {
  _name: '',

  getName: function() {
    return this._name;
  },

  setName: function(name) {
    if (typeof name === 'string') {
      this._name = name;
    } else {
      throw new Error('Name must be a string');
    }
  }
};

// Export the object
module.exports = personObject;