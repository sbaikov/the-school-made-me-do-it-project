// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ee.itcollege.i377.team29.web;

import ee.itcollege.i377.team29.entities.Piirivalvur;
import ee.itcollege.i377.team29.entities.Vahtkond;
import ee.itcollege.i377.team29.entities.Vahtkonna_liige;
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

privileged aspect Vahtkonna_liigeController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String Vahtkonna_liigeController.create(@Valid Vahtkonna_liige vahtkonna_liige, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("vahtkonna_liige", vahtkonna_liige);
            addDateTimeFormatPatterns(uiModel);
            return "vahtkonna_liiges/create";
        }
        uiModel.asMap().clear();
        vahtkonna_liige.persist();
        return "redirect:/vahtkonna_liiges/" + encodeUrlPathSegment(vahtkonna_liige.getVahtkonna_liige_ID().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String Vahtkonna_liigeController.createForm(Model uiModel) {
        uiModel.addAttribute("vahtkonna_liige", new Vahtkonna_liige());
        addDateTimeFormatPatterns(uiModel);
        return "vahtkonna_liiges/create";
    }
    
    @RequestMapping(value = "/{vahtkonna_liige_ID}", method = RequestMethod.GET)
    public String Vahtkonna_liigeController.show(@PathVariable("vahtkonna_liige_ID") Long vahtkonna_liige_ID, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("vahtkonna_liige", Vahtkonna_liige.findVahtkonna_liige(vahtkonna_liige_ID));
        uiModel.addAttribute("itemId", vahtkonna_liige_ID);
        return "vahtkonna_liiges/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String Vahtkonna_liigeController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("vahtkonna_liiges", Vahtkonna_liige.findVahtkonna_liigeEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Vahtkonna_liige.countVahtkonna_liiges() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("vahtkonna_liiges", Vahtkonna_liige.findAllVahtkonna_liiges());
        }
        addDateTimeFormatPatterns(uiModel);
        return "vahtkonna_liiges/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String Vahtkonna_liigeController.update(@Valid Vahtkonna_liige vahtkonna_liige, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("vahtkonna_liige", vahtkonna_liige);
            addDateTimeFormatPatterns(uiModel);
            return "vahtkonna_liiges/update";
        }
        uiModel.asMap().clear();
        vahtkonna_liige.merge();
        return "redirect:/vahtkonna_liiges/" + encodeUrlPathSegment(vahtkonna_liige.getVahtkonna_liige_ID().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{vahtkonna_liige_ID}", params = "form", method = RequestMethod.GET)
    public String Vahtkonna_liigeController.updateForm(@PathVariable("vahtkonna_liige_ID") Long vahtkonna_liige_ID, Model uiModel) {
        uiModel.addAttribute("vahtkonna_liige", Vahtkonna_liige.findVahtkonna_liige(vahtkonna_liige_ID));
        addDateTimeFormatPatterns(uiModel);
        return "vahtkonna_liiges/update";
    }
    
    @RequestMapping(value = "/{vahtkonna_liige_ID}", method = RequestMethod.DELETE)
    public String Vahtkonna_liigeController.delete(@PathVariable("vahtkonna_liige_ID") Long vahtkonna_liige_ID, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Vahtkonna_liige.findVahtkonna_liige(vahtkonna_liige_ID).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/vahtkonna_liiges";
    }
    
    @ModelAttribute("piirivalvurs")
    public Collection<Piirivalvur> Vahtkonna_liigeController.populatePiirivalvurs() {
        return Piirivalvur.findAllPiirivalvurs();
    }
    
    @ModelAttribute("vahtkonds")
    public Collection<Vahtkond> Vahtkonna_liigeController.populateVahtkonds() {
        return Vahtkond.findAllVahtkonds();
    }
    
    @ModelAttribute("vahtkonna_liiges")
    public Collection<Vahtkonna_liige> Vahtkonna_liigeController.populateVahtkonna_liiges() {
        return Vahtkonna_liige.findAllVahtkonna_liiges();
    }
    
    void Vahtkonna_liigeController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("vahtkonna_liige_avatud_date_format", "yyyy-MM-dd");
        uiModel.addAttribute("vahtkonna_liige_suletud_date_format", "yyyy-MM-dd");
        uiModel.addAttribute("vahtkonna_liige_muudetud_date_format", "yyyy-MM-dd");
        uiModel.addAttribute("vahtkonna_liige_alates_date_format", "yyyy-MM-dd");
        uiModel.addAttribute("vahtkonna_liige_kuni_date_format", "yyyy-MM-dd");
    }
    
    String Vahtkonna_liigeController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
