prawn_document do |pdf|
pdf.font_families.update(
   "Times-Roman" => { :bold        => File.join(Rails.root, "fonts", "Times New Roman Bold.ttf"),
                      :italic      => File.join(Rails.root, "fonts", "Times New Roman Italic.ttf"),
                      :bold_italic => File.join(Rails.root, "fonts", "Times New Roman Bold Italic.ttf"),
                      :normal      => File.join(Rails.root, "fonts", "Times New Roman.ttf") })
pdf.font "Times-Roman"

pdf.move_down 20
pdf.table([
		[{ colspan: 2, content: "Variabilní symbol: #{@person.vs}", align: :right}],
		[{ colspan: 2, content: "Přihláška do Strany svobodných občanů", size: 17, font_style: :bold}],
		["Jméno", @person.name],
		["Ulice", @person.domestic_address_street],
		["Obec", @person.domestic_address_city],
		["PSČ", @person.domestic_address_zip],
		["Kraj", @person.domestic_region.try(:name)],
		["Datum narození", l(@person.date_of_birth)],
		["Telefon", @person.phone],
		["Email", @person.email],
		[{ colspan: 2, content: "Dřívější členství v politických stranách"}],
		[{ colspan: 2, content: @person.previous_political_parties.blank? ? "-" : @person.previous_political_parties }],
		[{ colspan: 2, content: "Dřívější kandidatury ve volbách"}],
		[{ colspan: 2, content: @person.previous_candidatures.blank? ? "-" : @person.previous_candidatures}],
		[{ colspan: 2, content: "Prohlašuji, že nejsem členem jiné politické strany, že souhlasím se stanovami, programovým prohlášením, že jsem nebyl členem Lidových milicí ani spolupracovníkem či agentem STB, že všechny uvedené údaje jsou pravdivé a že souhlasím se zpracováním a správou uvedených údajů Stranou svobodných občanů"}],
		["Datum:","Podpis:"]], position: :center, column_widths: [100, 300])
pdf.move_down 20
pdf.text "Podepsanou přihlášku zašlete prosím na adresu:"
pdf.text "Strana svobodných občanů"
pdf.text "Perucká 2196/14"
pdf.text "120 00 Praha 2"
end
