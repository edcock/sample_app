require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name: 'Example', email: 'test@test.fr', password: 'password', password_confirmation: 'password')
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'name should be present' do
    @user.name = '  '
    assert_not @user.valid?
  end

  test 'email should be present' do
    @user.email = ' '
    assert_not @user.valid?
  end

  test 'name should not be too long' do
    @user.name = 'a' * 51
    assert_not @user.valid?
  end
  test 'email should not be too long' do
    @user.email = 'a' * 248 + '@test.fr'
    assert_not @user.valid?
  end
  test 'email validation should accept valid addresses' do
    valid_addresses = %W(test@test.fr TEST@test.COM A_TE-ST@te.ST.fr alice+bob@test.fr)
    valid_addresses.each { |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address} should be valid"
    }
  end
  test 'email validation should reject invalid addresses' do
    invalid_addresses = %W(test@test,fr TEST.test.COM A_TE-ST@te_ST.fr test@alice+bob.fr)
    invalid_addresses.each { |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address} should be invalid"
    }
  end
  test 'email address should be unique' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test 'email should store as lowercase' do
    mix_case_email = 'TeSt@GOMAO.com'
    @user.email = mix_case_email
    @user.save
    assert_equal @user.email, mix_case_email.downcase

  end


  test 'password should have minimum length' do
    @user.password = @user.password_confirmation = 'a' * 5
    assert_not @user.valid?
  end
end
