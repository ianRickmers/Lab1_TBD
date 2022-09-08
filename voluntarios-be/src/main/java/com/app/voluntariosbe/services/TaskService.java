package com.app.voluntariosbe.services;

import com.app.voluntariosbe.models.Task;
import com.app.voluntariosbe.repositories.TaskRepository;

import org.springframework.web.bind.annotation.*;

import java.util.List;
@CrossOrigin
@RestController
public class TaskService {

    private final TaskRepository taskRepository;
    TaskService(TaskRepository taskRepository){this.taskRepository = taskRepository;}

    @GetMapping("/tasks")
    public List<Task> getAllTasks(){ return taskRepository.getAllTask();}

    @GetMapping("/tasks/count")
    public String countTasks(){
        int total = taskRepository.countTask();
        return String.format("tienes %s Tareas!", total );
    }

    @PostMapping("/tasks")
    @ResponseBody
    public Task createTask(@RequestBody Task task){
        Task result = taskRepository.createTask(task);
        return result;
    }
    @PostMapping("/tasks/update")
    public Task updateTask(@RequestBody Task task){return taskRepository.updateTask(task);}

    @PostMapping("/tasks/delete")
    public void deleteTaskById(@RequestBody int id){
        taskRepository.deleteTaskById(id);
    }

    @GetMapping("/tasks/{id}")
    public Task getTaskById(@RequestBody int id){
        return taskRepository.getTaskById(id);}

}
