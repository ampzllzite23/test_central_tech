*** Variables ***
${officemate_url}   https://www.officemate.co.th/en
${modal_campaign}   //iframe[contains (@classname,"sp-fancybox-iframe")]
${close_campaign}   //div[contains(@class,"element-close-button") and contains(@id,"wrap-close-button")]
${search_textinput}     //input[@class="_5vxBY _32CNv _2MLml"]
${search_button}    //div[@id="btn-searchResultPage"]
${search_result_product}     //a[contains(@id,'lbl-ProductPreview-Name')]
${search_notfound}      //div[@id="pnl-listPageNotFound"]/div[@class="title"]

${endpoint}   https://www.officemate.co.th/api/search/products