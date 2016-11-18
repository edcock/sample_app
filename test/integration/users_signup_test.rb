require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test 'invalid signup form' do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: {name: '',
                              email: 'foobar@invalid',
                              password: 'toto',
                              password_confirmation: 'tata'}
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.alert'
    assert_select 'div.alert-danger'
  end


  test 'valid signup information' do
    get signup_path
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: {name: 'test',
                                           email: 'foobar@valid.com',
                                           password: 'password',
                                           password_confirmation: 'password'}
    end
    assert_template 'users/show'
    assert_select 'div.alert-success'
    assert_not flash.nil?
  end

end
