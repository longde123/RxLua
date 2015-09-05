describe('last', function()
  it('produces an error if its parent errors', function()
    local observable = Rx.Observable.fromValue(''):map(function(x) return x() end)
    expect(observable.subscribe).to.fail()
    expect(observable:last().subscribe).to.fail()
  end)

  it('produces no elements if its parent produces no elements', function()
    local observable = Rx.Observable.create(function(observer) return observer:onComplete() end):last()
    expect(observable).to.produce({})
  end)

  it('produces the last element of its parent and immediately completes', function()
    local observable = Rx.Observable.fromRange(5):last()
    expect(observable).to.produce(5)
  end)
end)


