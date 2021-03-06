$ ->
  class NBSEngine
    expandMyMenu: () ->
      $("nav.nbs-sidebar").removeClass("nbs-sidebar-menu-collapsed").addClass("nbs-sidebar-menu-expanded")

    collapseMyMenu: () ->
      $("nav.nbs-sidebar").removeClass("nbs-sidebar-menu-expanded").addClass("nbs-sidebar-menu-collapsed")

    showMenuTexts: () ->
      $("nav.nbs-sidebar ul a span.expanded-element").show()

    hideMenuTexts: () ->
      $("nav.nbs-sidebar ul a span.expanded-element").hide()

    showActiveSubMenu: () ->
      $("li.active ul.nbs-level2").show()
      $("li.active a.expandable").css({width: "100%"})

    hideActiveSubMenu: () ->
      $("li.active ul.nbs-level2").hide()

    adjustPaddingOnExpand: () ->
      $("ul.nbs-level1 li a.expandable").css({padding: "1px 4px 4px 0px"})
      $("ul.nbs-level1 li.active a.expandable").css({padding: "1px 4px 4px 4px"})

    resetOriginalPaddingOnCollapse: () ->
      $("ul.nbs-level1 li a.expandable").css({padding: "4px 4px 4px 0px"})
      $("ul.nbs-level1 li.active a.expandable").css({padding: "4px"})

    ignite: () ->

      ((nbs_instance) ->
        $("#justify-icon").click (e) ->

          if $(this).parent("nav.nbs-sidebar").hasClass("nbs-sidebar-menu-collapsed")
            nbs_instance.adjustPaddingOnExpand()

            nbs_instance.expandMyMenu()
            nbs_instance.showMenuTexts()
            nbs_instance.showActiveSubMenu()

            $(this).css({color: "#000"})

          else if $(this).parent("nav.nbs-sidebar").hasClass("nbs-sidebar-menu-expanded")
            nbs_instance.resetOriginalPaddingOnCollapse()

            nbs_instance.collapseMyMenu()
            nbs_instance.hideMenuTexts()
            nbs_instance.hideActiveSubMenu()

            $(this).css({color: "#FFF"})

          false
      )(this)

  (new NBSEngine).ignite()
  
  