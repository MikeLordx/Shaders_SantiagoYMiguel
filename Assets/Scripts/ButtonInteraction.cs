using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ButtonInteraction : MonoBehaviour
{
    public GameObject _rotateButton;
    public GameObject _scaleButton;
    private GameObject _GameObject;

    private void Start()
    {
        _rotateButton.SetActive(false);
        _scaleButton.SetActive(false);
    }

    private void OnTriggerEnter(Collider other)
    {
        _rotateButton.SetActive(true);
        _scaleButton.SetActive(true);
        AssignGameObject(other.gameObject);
    }

    private void OnTriggerExit(Collider other)
    { 
        _rotateButton.SetActive(false);
        _scaleButton.SetActive(false);
    }

    public void ObjectRotation()
    {
        _GameObject.transform.Rotate(5.0f, 10.0f, 5.0f, Space.Self);
    }

    public void ObjectScale()
    {
        _GameObject.transform.localScale += new Vector3(1, 1, 1);
    }

    public void AssignGameObject(GameObject obj)
    {
        _GameObject = obj;
    }
}
