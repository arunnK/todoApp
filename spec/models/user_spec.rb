RSpec.describe User do
	let(:new_user) { FactoryGirl.create(:user) }
	let(:new_user1) { FactoryGirl.build(:user) }

	context 'validations' do
		context 'name validation' do
			it 'when first_name is present' do
		  		expect(new_user.valid?).to be true
			end
			it 'when first_name is not present' do
			 	new_user.first_name=nil
		 	 	expect(new_user.valid?).to be false
			end	

			it 'when last_name is not present' do
				expect(new_user.valid?).to be true
			end
			it 'when last_name is not present' do
			 	new_user.last_name=nil
		 	 	expect(new_user.valid?).to be false
			end	
		end

		context 'email validations' do
			context 'email presence validation' do
				it 'when email is present' do
				  expect(new_user.valid?).to be true
				end
				it 'when email is not present' do
				 	new_user.email=nil
			 	 	expect(new_user.valid?).to be false
				end	
			end	
			context 'email uniqueness validation' do
				it 'when email is not unique' do
          new_user
				  expect(new_user1.valid?).to be false
				end
				it 'when email is unique' do
				 	new_user1.email='abc@gmail.com'
			 	 	expect(new_user1.valid?).to be true
				end	
			end	
			context 'email format validation' do
				it 'when email is valid' do
					expect(new_user.valid?).to be true
				end	
				it 'when email format is not valid' do
					new_user.email = 'bad_email'
					expect(new_user.valid?).to be false
				end
			end
		end

		context 'phone validation' do
			it 'should validate presence of :phone' do
			  expect(new_user.valid?).to be true
			end
			it 'should invalidate unpresence of :phone' do
			 	new_user.phone=nil
		 	 	expect(new_user.valid?).to be false
			end	
		end

	end

	it 'should give the full name' do
		expect(new_user.to_s).to eq('Arun Kumar')
	end

end

