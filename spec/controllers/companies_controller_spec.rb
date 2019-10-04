require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do
  before(:each) do
    @company = create(:company)
  end

  it { should route(:get, '/companies').to(action: :index) }
  it { should route(:get, '/companies/1').to(action: :show, id: 1) }
  it { should route(:get, '/companies/new').to(action: :new) }
  it { should route(:get, '/companies/1/edit').to(action: :edit, id: 1) }
  it { should route(:post, '/companies').to(action: :create) }
  it { should route(:put, '/companies/1').to(action: :update, id:1) }
  it { should route(:delete, '/companies/1').to(action: :destroy, id: 1) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    context 'when name is invalid' do
      it 'renders the page with error' do
        company = create(:company)

        post :create, params: { company: { name: nil, website: company.website } }

        expect(response).to render_template(:new)
        expect(flash[:notice]).to match(nil)
      end
    end
  end
end
