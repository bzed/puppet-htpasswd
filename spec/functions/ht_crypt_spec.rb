require 'spec_helper'

describe 'ht_crypt' do
  it 'does exist' do
    Puppet::Parser::Functions.function('ht_crypt').does == 'function_ht_crypt'
  end

  it 'does raise a ParseError if there is less than 2 argument' do
    is_expected.to run.with_params('testpassword').and_raise_error(Puppet::ParseError)
  end

  it 'does raise a ParseError if there is more than 2 arguments' do
    is_expected.to run.with_params('testpassword', 'test2', 3).and_raise_error(Puppet::ParseError)
  end

  it 'does raise a ParseError if passed not a string' do
    is_expected.to run.with_params(42, 'str').and_raise_error(Puppet::ParseError)
  end

  it 'does return crypt password' do
    is_expected.to run.with_params('testpassword', '46').and_return('46ursI0BCy7gc')
  end
end
