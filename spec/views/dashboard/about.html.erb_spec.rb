RSpec::Matchers.define :have_title do |item|
  match do |page|
    selector = '.' + item + ' h3'
    Capybara.string(page.body).has_selector?(selector, text: item.capitalize)
  end
end

RSpec::Matchers.define :have_list_of_items do |selector, items|
  match do |page|
    selector = selector + ' ul li'
    items.map do |item|
      # TODO: divide fail msg for array (items) into fail msg for every item
      expect(page).to have_selector(selector, text: item)
    end
  end
end

describe "About Page" do
  describe "GET /about" do
    
    before (:each) do
      visit "/about"
    end
    
    it "request success" do
      expect(page.status_code).to be(200)
    end
    
    it "has title" do
      expect(page).to have_selector 'h2', text: "About Me"
    end
    
    context "CV parts" do
    
      all_classes = ["summary","skills","experience","education","languages","courses"]
        
      describe "classes" do
        all_classes.map do |klas|
          it "has class #{klas}" do
            expect(page).to have_css('.' + klas)
          end
        end
      end

      describe "title" do
        all_classes.map do |klas|
          it "has title #{klas.capitalize}" do
            expect(page).to have_title(klas)
          end
        end
      end

      describe "summary" do
        it "has name" do
          expect(page).to have_selector('strong', text: "Raman Skaskevich")
        end
      end
      
      describe "skills" do
        it "has list of skills" do
          items = ['Ruby','Ruby on Rails','JavaScript','HTML/CSS']
          expect(page).to have_list_of_items('.skills', items)
        end
      end
      
      describe "experience" do
        let(:klas) { '.experience' }
        describe "list of jobs" do
          it "Ericpol" do
            expect(find(klas)).to have_content('Ericpol')
            expect(find(klas)).to have_content('Junior Software Developer')
            expect(find(klas)).to have_content('08.2012 - 12.2014')
          end
          it "Ericsson Ericpol" do
            expect(find(klas)).to have_content('Ericsson Ericpol')
            expect(find(klas)).to have_content('Software Developer')
            expect(find(klas)).to have_content('01.2015 - ongoing')
          end
        end
      end
      
      describe "education" do
        let(:klas) { '.education' }
        describe "list of schools" do
          it "BrSTU" do
            expect(find(klas)).to have_content('Brest State Technical University')
            expect(find(klas)).to have_content('Bachelor of Computer Science')
            expect(find(klas)).to have_content('09.2007 - 06.2012')
          end
        end
      end
      
      describe "languages" do
        it "has list of languages" do
          items = ['English','Polish','Russian','Belarussian']
          expect(page).to have_list_of_items('.languages', items)
        end
      end
      
      describe "courses" do
        let(:klas) { '.courses' }
        describe "list of courses" do
          it "Coursera" do
            expect(find(klas)).to have_content('Web Application Architectures')
            expect(find(klas)).to have_content('Coursera Verified Certificates')
            expect(find(klas)).to have_content('04.2015 - 05.2015')
          end
        end
      end
      
    end
    
    context "Admin area" do
      
      describe "area" do
        it "present" do
          expect(page).to have_css('.admin-area')
        end
      end
      
      # TODO: Check social network, synch (update), Device gem
    end
    
  end
end