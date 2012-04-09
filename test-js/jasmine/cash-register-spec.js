(function() {

  describe("Dish", function() {
    beforeEach(function() {
      return this.dish = new Dish('Serloin Steak $18.99 mains');
    });
    it("extracts title", function() {
      return (expect(this.dish.title)).toEqual('Serloin Steak');
    });
    return it("extracts price", function() {
      return (expect(this.dish.price)).toEqual('$18.99');
    });
  });

  describe("Money", function() {
    describe("valid value", function() {
      beforeEach(function() {
        return this.money = new Money('$15.99');
      });
      it("parses to cents", function() {
        return (expect(this.money.cents)).toEqual(1599);
      });
      it("formats correctly to string", function() {
        return (expect(this.money.toString())).toEqual('$15.99');
      });
      return it("correctly parses a sub 10 cent string", function() {
        var money;
        money = new Money('$0.09');
        return (expect(money.cents)).toEqual('09');
      });
    });
    return describe("invalid value", function() {
      return it("sets cents to 0 if a valid value cant be parsed", function() {
        var money;
        money = new Money('NOT A DOLLAR');
        return (expect(money.cents)).toEqual(0);
      });
    });
  });

}).call(this);
