/*
  This model controls what gets served to Fiori frontends...
*/


// 1) fiori annotations common to all apps...
using  from './cat-service';

annotate CatalogService.Authors with @(
	UI: {
		Identification: [{Value:name}],
	  SelectionFields: [ ID, name ],
		LineItem: [
			{Value: ID},
			{Value: name}
		],
    HeaderInfo: {
      TypeName: 'Author', TypeNamePlural: 'Authors',
      Title: { Value: ID },
      Description: { Value: name }
    },
	}
);

////////////////////////////////////////////////////////////////////////////
//
//	Books Lists
//
annotate CatalogService.Books with @(
	UI: {
		Identification: [{Value:title}],
	  SelectionFields: [ ID, author.name ],
		LineItem: [
			{Value: ID},
			{
				Value: title
			},
			{
				Value: author.name
			},
			{
			     Value: stock
				
			},
		
			{
				Value: author.ID
			}
			

		]
	},
) {
	author @(
		// Common.Text: { $value:author.name, "@UI.TextArrangement": #TextOnly },
		ValueList.entity:'Authors',
		// Common.ValueList.Parameters:[
		// 	{ $Type:'Common.ValueListParameterInOut', LocalDataProperty:author_name, ValueListProperty:'name' },
		// ],		
	);
}

////////////////////////////////////////////////////////////////////////////
//
//	Books Details
//
annotate CatalogService.Books with @(
	UI: {
  	HeaderInfo: {
  		TypeName: 'Book',
  		TypeNamePlural: 'Books',
  		Title: {Value: title},
  		Description: {Value: author.name}
  	},
	}
);



////////////////////////////////////////////////////////////////////////////
//
//	Books Elements
//
annotate CatalogService.Books with {
	ID @title:'ID';
	title @title:'Title';
	author @title:'AuthorID';
	stock @title:'{i18n>Stock}';
}


////////////////////////////////////////////////////////////////////////////
//
//	Authors Elements
//
annotate CatalogService.Authors with {
	ID @title:'ID' @UI.HiddenFilter;
	name @title:'AuthorName';
}