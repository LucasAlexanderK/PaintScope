package paintscope.controllers;

import paintscope.models.PaintColor;
import paintscope.repository.PaintColorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/colors")
public class PaintColorController {
    
    @Autowired
    private PaintColorRepository paintColorRepository;
    
    @GetMapping("/search")
    public List<PaintColor> searchColors(@RequestParam String name) {
        return paintColorRepository.findByNameContainingIgnoreCase(name);
    }
    
    @PostMapping
    public PaintColor addColor(@RequestBody PaintColor paintColor) {
        return paintColorRepository.save(paintColor);
    }
    
    @GetMapping
    public List<PaintColor> getAllColors() {
        return paintColorRepository.findAll();
    }
}