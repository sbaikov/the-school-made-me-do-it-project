// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ee.itcollege.i377.team29.web;

import ee.itcollege.i377.team29.entities.Isik_intsidendis;
import ee.itcollege.i377.team29.entities.Objekt;
import ee.itcollege.i377.team29.entities.Piiririkkuja;
import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect PiiririkkujaController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String PiiririkkujaController.create(@Valid Piiririkkuja piiririkkuja, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("piiririkkuja", piiririkkuja);
            addDateTimeFormatPatterns(uiModel);
            return "piiririkkujas/create";
        }
        uiModel.asMap().clear();
        piiririkkuja.persist();
        return "redirect:/piiririkkujas/" + encodeUrlPathSegment(piiririkkuja.getPiiririkkuja_ID().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String PiiririkkujaController.createForm(Model uiModel) {
        uiModel.addAttribute("piiririkkuja", new Piiririkkuja());
        addDateTimeFormatPatterns(uiModel);
        return "piiririkkujas/create";
    }
    
    @RequestMapping(value = "/{piiririkkuja_ID}", method = RequestMethod.GET)
    public String PiiririkkujaController.show(@PathVariable("piiririkkuja_ID") Long piiririkkuja_ID, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("piiririkkuja", Piiririkkuja.findPiiririkkuja(piiririkkuja_ID));
        uiModel.addAttribute("itemId", piiririkkuja_ID);
        return "piiririkkujas/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String PiiririkkujaController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("piiririkkujas", Piiririkkuja.findPiiririkkujaEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Piiririkkuja.countPiiririkkujas() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("piiririkkujas", Piiririkkuja.findAllPiiririkkujas());
        }
        addDateTimeFormatPatterns(uiModel);
        return "piiririkkujas/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String PiiririkkujaController.update(@Valid Piiririkkuja piiririkkuja, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("piiririkkuja", piiririkkuja);
            addDateTimeFormatPatterns(uiModel);
            return "piiririkkujas/update";
        }
        uiModel.asMap().clear();
        piiririkkuja.merge();
        return "redirect:/piiririkkujas/" + encodeUrlPathSegment(piiririkkuja.getPiiririkkuja_ID().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{piiririkkuja_ID}", params = "form", method = RequestMethod.GET)
    public String PiiririkkujaController.updateForm(@PathVariable("piiririkkuja_ID") Long piiririkkuja_ID, Model uiModel) {
        uiModel.addAttribute("piiririkkuja", Piiririkkuja.findPiiririkkuja(piiririkkuja_ID));
        addDateTimeFormatPatterns(uiModel);
        return "piiririkkujas/update";
    }
    
    @RequestMapping(value = "/{piiririkkuja_ID}", method = RequestMethod.DELETE)
    public String PiiririkkujaController.delete(@PathVariable("piiririkkuja_ID") Long piiririkkuja_ID, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Piiririkkuja.findPiiririkkuja(piiririkkuja_ID).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/piiririkkujas";
    }
    
    @ModelAttribute("isik_intsidendises")
    public Collection<Isik_intsidendis> PiiririkkujaController.populateIsik_intsidendises() {
        return Isik_intsidendis.findAllIsik_intsidendises();
    }
    
    @ModelAttribute("objekts")
    public Collection<Objekt> PiiririkkujaController.populateObjekts() {
        return Objekt.findAllObjekts();
    }
    
    @ModelAttribute("piiririkkujas")
    public Collection<Piiririkkuja> PiiririkkujaController.populatePiiririkkujas() {
        return Piiririkkuja.findAllPiiririkkujas();
    }
    
    void PiiririkkujaController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("piiririkkuja_avatud_date_format", "yyyy-MM-dd");
        uiModel.addAttribute("piiririkkuja_suletud_date_format", "yyyy-MM-dd");
        uiModel.addAttribute("piiririkkuja_muudetud_date_format", "yyyy-MM-dd");
        uiModel.addAttribute("piiririkkuja_synniaeg_date_format", "yyyy-MM-dd");
    }
    
    String PiiririkkujaController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
